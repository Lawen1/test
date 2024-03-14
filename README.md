[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/4qoQ_ab5)
# Assignment Bash

## Shell

### `ASSIGNMENT` 1/3 Read from file

- Create a program that reads the file `data/customer.csv`

  ```text
  first_name;last_name;year;credit_card_number
  Destiny;Vasquez;1972;180056878179070
  ```

- Create a bash script that reads the file
- Loop and print `Lastname` - `Firstname` then show the 5 first numbers in the credit card, the rest should be masked ie `12345********`

- [ ] Hand in the script file

### `ASSIGNMENT` 2/3 Parse Apache logs

- Create a program that reads the apache log file `data/access_log_20210128-185931.log`
- You should be able to filter by source ip
- You should be able to filter by browser, i.e Safari, chrome

- [ ] Hand in the script file

### `ASSIGNMENT` 3/3 Ping multiple hosts

- Create a program that takes multiple hostnames in an array or file
- Iterate through the list of hostname and ping every host i.e 1, 2, 3 time
- If the host don't reply, fail the program with a exit code

- [ ] Hand in the script file
