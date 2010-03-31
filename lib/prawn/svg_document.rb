module Prawn
  class Document
    #
    # Draws an SVG document into the PDF.
    #
    # +options+ must contain the key :at, which takes a tuple of x and y co-ordinates.
    #
    # +options+ can optionally contain the key :width or :height.  If both are 
    # specified, only :width will be used.  If neither are specified, the resolution
    # given in the SVG will be used.
    #
    # Example usage:
    #
    #   svg IO.read("example.svg"), :at => [100, 300], :width => 600
    #
    def svg(data, options={})
      svg = Prawn::Svg.new(data, self, options)
      svg.draw
      {:warnings => svg.parser_warnings, :width => svg.parser.width, :height => svg.parser.height}
    end
  end
end
