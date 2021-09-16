# README
## Starting the Server
Run 'bundle install' to install the dependencies. 
Run 'rails db:migrate' to run the migrations for the database. 
To start the rails server run 'rails s'.

## Testing the API with the SPA
To test the backend I made a Singe Page Application which has forms for adding new transactions and spending points. To use the page for testing make sure to run the server and open 'index.html' located in the root directory of this application. You can open the console for viewing the responses after submitting the forms. The SPA uses JavaScript for submitting forms without reloading. 

## Manual Testing
You can manually test the API by making requests to the API endpoints.
### Adding Transactions
To add a transaction send a POST request to 'http://localhost:3000/transactions' with a body of stringified JSON data in the form of...
{transaction:
    {
        payer: string,
        points: integer,
        timestamp: datetime
    }
}

Succesfully adding a transaction will return JSON of the newly added transcation.
### Spending Points
To spend points send a POST request to 'http://localhost:3000/spend' with a body of stringified JSON data in the form of...
{points: integer}

Spending points will return JSON of the payers that had points withdrawn and the amount points that was withdrawn from those payers.
### Viewing Points
To view points send a GET request to 'http://localhost:3000/points'
Returns JSON of each payer and the amount of points that is available from those payers. I.E. {payer: points}

### Viewing Transactions
To view transactions send a GET request to 'http://localhost:3000/transactions'
Returns JSON of each transaction including the payer, points and time.
