module GeoTools
  class Polygon
    def initialize(points)
      @points = points

      # ensure it's a closed polygon
      @points << points[0] if points[0] != points[-1]
    end

    def contains?(point)
      # horizontal ray method based on MacMartin algorithm from:
      # https://erich.realtimerendering.com/ptinpoly/
      numverts = @points.length - 1

      tx = point[0]
      ty = point[1]

      vtx0 = @points[numverts - 1]
      yflag0 = (vtx0[1] >= ty)

      inside_flag = false

      numverts.div(2).times do |index|
        vtx1 = @points[index * 2]
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
  end
end
