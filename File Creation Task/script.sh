# 1. Create a directory and navigate into it
mkdir my_folder
cd my_folder

# 2. Create "my_file.txt" with some text
echo "This is the content of my_file.txt" > my_file.txt

# 3. Create "another_file.txt" with some text
echo "This is the content of another_file.txt" > another_file.txt

# 4. Concatenate "another_file.txt" content into "my_file.txt"
cat another_file.txt >> my_file.txt

# 5. Display the updated content of "my_file.txt"
cat my_file.txt

# 6. List all files and directories
ls -l

# 7. Create 20 .txt files
for i in {1..20}; do
  echo "File number $i" > file_$i.txt
done

# 8. Rename the first 5 files to .yml
for i in {1..5}; do
  mv file_$i.txt file_$i.yml
done

# 9. Print the latest created top 5 files
ls -lt | head -n 5
