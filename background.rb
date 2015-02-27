# encoding: utf-8

@@queue = []
class Background
    def initialize
        th = Thread.new do
            while @@queue.index(th) != 0
                sleep 10
            end

            begin
                yield
            rescue Exception => e
                @error = e
            ensure
                @@queue.delete(th)
                @block.call if @block
            end
        end

        @@queue << th
    end

    def finished(*arg, &block)
        @block = block
    end
    
    def error?
        !@error.nil?
    end
    
    def error
        @error
    end
end
