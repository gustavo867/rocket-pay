defmodule Rocketpay.Accounts.Withdraw do
  alias Rocketpay.{Repo, Accounts}

  def call(params) do
    params
    |> Accounts.Operation.call(:withdraw)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{withdraw: account}} -> {:ok, account}
    end
  end
end
