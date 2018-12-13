def closestPair(coordinates)
  min_distance = Float::INFINITY
  coordinates.each_slice(2) do |x,y|
    coordinates.each_slice(2) do |i,j|
      if x != i && y != j
        distance = Math.sqrt((x-i) ** 2 + (y-j) ** 2)
        min_distance = distance if distance < min_distance
      end
    end
  end
  min_distance.round(5)
end








input = [[0.8239934173914427, 0.1319694539175018, 0.8342200042902134, 0.7131084191082707, 0.09916950054781792, 0.06385940977543703, 0.9728160689903603, 0.9866024736887545, 0.9894053123073387, 0.3231668870036569, 0.6921178364907058, 0.4819960661900089, 0.08838176109695095, 0.7032698234535882, 0.22954065151820313, 0.9502101028876844, 0.5391591247928582, 0.6384250501809671, 0.9814608698617646, 0.5369293900667655]]
input << [0.6388044987085864, 0.12321774889011616, 0.7631735419761853, 0.26690298233789356, 0.7745298089998389, 0.5709748672482575, 0.815971852489384, 0.05716225723290613, 0.41977191515203693, 0.5915341024187767, 0.8708500428192745, 0.3462113786239953, 0.9562543197505027, 0.31021716148750955, 0.7613848370934122, 0.21684706202511406, 0.08675924520112632, 0.5578024766082902, 0.1817101693411829, 0.06447737794915154, 0.035445499160458915, 0.9052005981073605, 0.7839302243682793, 0.390514225004304, 0.6262267054556485, 0.7289380529134011, 0.3800485831811793, 0.13098403792719426, 0.7177560573536871, 0.632919551816227, 0.6258853176841744, 0.4830335589619992, 0.5292277166859669, 0.8966652907009216, 0.2607429328638633, 0.8023598089749073, 0.9781191114964698, 0.746196135312332, 0.7041214718498525, 0.03619356668497009]
input.each{ |try| puts closestPair(try) }
