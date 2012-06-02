class Unrelated < ActiveRecord::Base
  class MySerializer
    def self.dump(obj)
      p(obj: obj)
      str = Base64.encode64(Marshal.dump(obj))
      p(str: str)
      str
    end

    def self.load(str)
      p(str: str)
      if str
        obj = Marshal.load(Base64.decode64(str))
        p(obj: obj)
        obj
      end
    end
  end

  serialize :for_yaml
  serialize :for_custom_serialize, MySerializer
end
