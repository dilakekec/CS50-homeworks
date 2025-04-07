import sqlite3
def main():
    conn = sqlite3.connect('songs.db')
    cursor = conn.Cursor()
    cursor.execute("SELECT * FROM songs LIMIT 5")
    rows = cursor.fetchall()
    with open('answers.txt', 'w') as file:
        file.write("First 5 songs from the database:\n")
        for row in rows:
            file.write(f"{row}\n")
    conn.close()
if __name__ == "__main__":
    main()
