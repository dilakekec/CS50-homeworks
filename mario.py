def main():
    height = get_height()
    for i in range(1, height + 1):
        print(" " * (height - i) + "#" * i + "  " + "#" * i)


def get_height():
    while True:
        try:
            h = int(input("Height: "))
            if 1 <= h <= 8:
                return h
        except ValueError:
            pass


main()
