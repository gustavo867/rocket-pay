defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Gustavo",
      age: 20,
      email: "gustavo@gmail",
      password: "123456",
      nickname: "gustavo867"
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response  = render(UsersView, "create.json", user: user)

    expect_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Gustavo",
        nickname: "gustavo867"
      }
    }

    assert expect_response == response
  end
end
