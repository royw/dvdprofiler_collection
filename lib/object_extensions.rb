# == Synopsis
# add a blank? method to all Objects
class Object
  my_extension("blank?") do
    # return asserted if object is nil or empty
    # TODO: not the safest coding, probably should dup before stripping.  Maybe should also compact
    def blank?
      result = nil?
      unless result
        if respond_to? 'empty?'
          if respond_to? 'strip'
            result = strip.empty?
          else
            result = empty?
          end
        end
      end
      result
    end
  end
end
