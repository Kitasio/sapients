# Create admin user
1. Connet to IEX (`iex -S mix` for develpment)
2. `alias Sapients.Accounts`
3. `user = %{email: "admin@whatever.mail", password: "yourpassword", is_admin: true, username: "Mark"}`
4. `Accounts.register_admin(user)`

# Colors customization
1. Open `tailwind.config.js` and add a color to `colors` object and to the `safelist`
2. Open `page_controller.ex` and add an atom with a color name to the list
