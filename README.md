# SIMPLE USER ACCOUNT api

endpoint: http://immense-badlands-24589.herokuapp.com/api/v0

## PATH

1. GET `/users` , get all users info
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/users"
    ```
2. POST `/users`, create an user
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/users"\
        -d email="test@email.com" \
        -d password="12345" \
        -d telephone_number="+85212341234" \
        -d first_name="John" \
        -d last_name="Doe"
    ```
3. GET `/users/:id`, get one user info
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/users/user_OddLbiE0KCdEn3EQ"
    ```
4. POST `/auth`, authenticate an user
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/auth"\
        -d email="test@email.com" \
        -d password="12345"
    ```
5. POST `/users/:user_id/accounts`, create account on current user
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/users/user_OddLbiE0KCdEn3EQ/accounts"\
        -d name="second_account" \
        -d card_number="1234567812345678"
    ```
6. GET `/users/:user_id/accounts`, get all accounts on this user
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/users/user_OddLbiE0KCdEn3EQ/accounts"
    ```
7. GET `/users/:user_id/accounts/:id`, get one account info on this user
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/users/user_OddLbiE0KCdEn3EQ/accounts/acc_wi-fijd4YZTJM85g"
    ```
8. POST `/users/:user_id/accounts/:id/topup`, topup account
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/users/user_OddLbiE0KCdEn3EQ/accounts/acc_wi-fijd4YZTJM85g/topup" \
        -d amount=600 \
    ```
9. POST `/payment`, create a payment
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/payments \
        -d amount=400 \
        -d description="test_description" \
        -d account_id="acc_wi-fijd4YZTJM85g" \
        -d currency="hkd"
    ```
10. GET `/accounts/:account_id/payments`, get all payments on this account
    ```
        curl "http://immense-badlands-24589.herokuapp.com/api/v0/accounts/acc_wi-fijd4YZTJM85g/payments \
    ```
