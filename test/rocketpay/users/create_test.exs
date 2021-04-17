defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Gustavo",
        age: 20,
        email: "gustavo@gmail",
        password: "123456",
        nickname: "gustavo867"
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Gustavo", age: 20, id: ^user_id} = user
    end

    test "when there are invalid params, returns an user" do
      params = %{
        name: "Gustavo",
        age: 15,
        email: "gustavo@gmail",
        nickname: "gustavo867"
      }

      {:error, changeset} = Create.call(params)

      expect_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert expect_response == errors_on(changeset)
    end
  end
end
