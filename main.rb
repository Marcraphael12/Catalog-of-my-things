require_relative './classes/app'

def main
  start = Startup.new
  loop do
    start.start
  end
end

main
