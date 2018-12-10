# Later

Later is an Elixir library that allows your application to schedule a process to run at any specific time in either local or distributed environment. It can optionally use `mnesia` to persist your scheduled processes with several logical strategies to make it even more robust.

## Installation

In your mix.exs

```
defp deps do
  [{:later, "~> 0.1"}]
end
```

## Usage

You can run a process after a few milliseconds:

```
Later.add(MyModule.do_something(a, b), 10_000)
```

or, if you prefer the MFA structure:

```
Later.add({MyModule, :do_something, [a, b]}, 10_000)
```

The default unit is millisecond, but you can also use `:second`, `:minute`, `:hour`, and `:day`

```
Later.add(MyModule.do_something(a, b), [after: 10, unit: :hour])
```

Sometimes, you might want to run a process at a specific time in the future:

```
# Do at a specific time in 3 days
now = DateTime.utc_now() |> DateTime.to_unix()

time =
  (now + 60*60*24*3)
  |> DateTime.from_unix!()
  |> Map.merge(%{hour: 20, minute: 0})

Later.at({MyModule, :do_something, []}, [at: time])
```

*Note:* At the time, Later only support `DateTime` value.

Use of [Timex](github link) is highly recommended for any date/time manipulation!

## Configuration

Configuration is optional, but highly recommended if you need your scheduled processes to survive crashes and restarts. Here's all the default options:

```
config :my_app, Later,
  global: false, # process will only run once on a specific node it was scheduled at
  retries: 0, # specify an integer, or use :infinity to always retry
  store: :ets, # use :mnesia for persistent, distributed storage, requires :global to be true
  min_peers: 1, # minimum number of connected nodes required before a process is eligible to run
```

These configuration options were explained in more details in the [documentation](hexdocs link)
