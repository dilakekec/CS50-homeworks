import csv
import sys


def main():

    if len(sys.argv) != 3:
        print("Usage: python dna.py database.csv sequence.txt")
        sys.exit(1)

    database_file = sys.argv[1]
    with open(database_file) as file:
        reader = csv.DictReader(file)
        people = list(reader)

    sequence_file = sys.argv[2]
    with open(sequence_file) as file:
        dna_sequence = file.read().strip()
    str_sequences = list(people[0].keys())[1:]
    str_counts = {str_seq: longest_match(dna_sequence, str_seq) for str_seq in str_sequences}
    for person in people:
        if all(int(person[str_seq]) == str_counts[str_seq] for str_seq in str_sequences):
            print(person["name"])
            return
    print("No match")


def longest_match(sequence, subsequence):
    max_count = 0
    seq_length = len(sequence)
    sub_length = len(subsequence)
    for i in range(seq_length):
        count = 0
        while sequence[i + count * sub_length: i + (count + 1) * sub_length] == subsequence:
            count += 1
        max_count = max(max_count, count)
    return max_count


if __name__ == "__main__":
    main()
