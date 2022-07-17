module PagesHelper
    def format_label(label)
        formatted = label.split("_").map {|i| i.capitalize}.join(" ")
    end
end
