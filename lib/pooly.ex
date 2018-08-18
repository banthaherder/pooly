defmodule Pooly do
  use Application

  @moduledoc """
  Documentation for Pooly.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pooly.hello
      :world

  """
  def start(_type, _args) do
    pool_config = [mfa: {SampleWorker, :start_link, []}, size: 5]
    start_pool(pool_config)
  end

  def start_pool(pool_config) do
    Pooly.Supervisor.start_link(pool_config)
  end

  def checkout do
    Pooly.Server.checkout
  end

  def chicken(worker_pid) do
    Pooly.Server.chicken(worker_pid)
  end

  def status do
    Pooly.Server.status
  end
  
end
