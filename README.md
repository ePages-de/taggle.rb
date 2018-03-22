# taggle.rb

This is an open source application for our BEYOND API. It enables merchants to easier work with tags by offering e.g. a Tagcloud.

## Authorization

To make use of this app, you can take your already existing BEYOND shop or you can [sign up](https://signup.beyondshop.cloud/) for a new one.

1. Sign in to your shop.
2. Go to the `Developer Area` section.
3. Click on the `Create custom app` button.
4. Enter an app name. (You can freely choose this name.)
5. Check all the scope checkboxes.
6. Click on the `Save` button --> You will receive your client_id and your client_secret.

Now, there are two ways to get this application up and running:

## For developers

Before starting, make sure that you are using the latest ruby version.

1. Clone the taggle.rb repository.
2. Run `bundle install`.
3. Create an `.env` file in you personal taggle.rb folder.
4. Add your `CLIENT_SECRET`, your `CLIENT_ID`and the `SHOP_URL` to this file. (As this file contains private information, you shouldn't publish it afterwards.)
5. Run `rails s`.
6. Open `localhost:3000` in your browser to open the app.


## For merchants

In order to use the app, you need to own a Heroku account.

1. Click this button:
2. Enter an app name. (You can freely choose this name.)
3. Choose your region.
4. Click on `Deploy App`.

5. Open Heroku.
6. Go to your App.
7. Go to the App settings.
8. Click on the `Reveal Config Vars` button.
9. Enter your `CLIENT_SECRET`, your `CLIENT_ID` and the `SHOP_URL`.
10. Click on the `Open app` button in the upper right corner.

After you followed these step once, you can directly enter your app by entering `YourAppName.herokuapp.com` in the browser.
