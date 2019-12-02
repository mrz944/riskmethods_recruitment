module GeoTools
  class Polygon
    def initialize(wkt_polygon)
      @points = wkt_to_coords(wkt_polygon)[0]

      # ensure it's a closed polygon
      @points << @points[0] if @points[0] != @points[-1]
    end

    def contains?(wkt_point)
      point = wkt_to_coords(wkt_point)

      # horizontal ray method based on MacMartin algorithm from:
      # https://erich.realtimerendering.com/ptinpoly/
      tx = point[0]
      ty = point[1]

      vtx0 = @points[-1]
      yflag0 = (vtx0[1] >= ty)

      inside_flag = false

      @points.each do |p|
        vtx1 = p

        yflag1 = (vtx1[1] >= ty)
        if yflag0 != yflag1
          xflag0 = (vtx0[0] >= tx)
          if xflag0 == (vtx1[0] >= tx)
            inside_flag = !inside_flag if xflag0
          elsif (vtx1[0] - (vtx1[1] - ty) * (vtx0[0] - vtx1[0]) / (vtx0[1] - vtx1[1])) >= tx
            inside_flag = !inside_flag
          end
        end

        yflag0 = yflag1
        vtx0 = vtx1
      end

      inside_flag
    end

    private

    def wkt_to_coords(wkt)
      factory = RGeo::Cartesian.preferred_factory
      factory.parse_wkt(wkt).coordinates
    end
  end
end
