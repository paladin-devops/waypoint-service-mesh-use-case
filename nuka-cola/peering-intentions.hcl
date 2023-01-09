Kind      = "service-intentions"
Name      = "counter-api"

Sources = [
  {
    Name   = "counter-ui"
    Peer   = "sunset-sarsaparilla"
    Action = "allow"
  }
]