require 'pathname'

module SCSSLint
    class Linter::ComponentFileCheck < Linter
        include LinterRegistry
        @components=[]
            
        def visit_root(_node)
            components = Dir.glob(config['glob'])
            outarray =[]

            components.each do |component|
                base = File.basename(component, '.scss')
                outarray.push(base)
            end  

            @components = outarray

            yield # Continue linting children
        end

        def visit_rule(node)
            selector = node.parsed_rules.to_s
            if selector.start_with?(".")
                selector = selector[1..-1] # remove leading .
                found = false

                @components.each do |component|
                    if (selector.start_with?(component))
                        found = true
                        break
                    end
                end

                if not found
                    add_lint(node, " #{selector} does not belong to a named component file")
                end
            end
            yield # Continue linting children
      
        end

    end
end