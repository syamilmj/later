defmodule Later do
  @moduledoc """
  Documentation for Later.
  """
  use GenServer

  def start_link() do

  end

  @doc """
  Registers a function to be invoked at specified time.

  First argument accepts either a MFA argument or a function,
  while the second argument accepts a list of options as follows:

    * `:after`
    * `:at`
    * `:retries`

  ### `after`

  This option specifies how much time should pass in seconds before
  the function is invoked.

  ### `at`

  This option accepts a DateTime value which specifies the exact
  time when function should invoked.

  Both `:after` and `:at` options are optional, but only one of them
  will be accepted. In such case where both are defined, the function
  will throw an ArgumentError.

  When none of them are specified, the function will be invoked immediately

  ### `retries`

  Specifies how many times the function will be invoked in case of failure,
  before it is discarded from the queue. Default is 0
  """
  def add({mod, fun, args}, _opts) do
    apply(mod, fun, args)
  end

  def add(func, _opts) do
    func.()
  end

  @doc """
  Removes a job from the queue.

  This will do a simple search for a matching MFA and remove the most
  recent result from the queue. Be careful when using this function
  as it may have unintended consequences

  Similar to `:add/2`
  """
  def remove({mod, fun, args}, _period) do
    apply(mod, fun, args)
  end

  def remove(fun) do

  end

  def remove_all({mod, fun, args}) do

  end

  def remove_all(fun) do

  end

  def now() do

  end

  @doc """
  List all currently scheduled jobs
  """
  def list() do
    """
    Action: MFA
    When: time
    """
  end
end
