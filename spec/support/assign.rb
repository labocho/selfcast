RSpec.configure do |config|
  config.include(
    Module.new do
      def assign(name, obj)
        instance_variable_set("@#{name}", obj)
      end
    end,
  )
end
