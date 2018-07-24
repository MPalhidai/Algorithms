def move(n, source = 1, target = 3, auxiliary = 2)
    if n > 0
        print "1 "
        # move n - 1 disks from source to auxiliary, so they are out of the way
        move(n - 1, source, auxiliary, target)

        # move the nth disk from source to target
        # make 2,3 empty stacks and 1 into (1..n).to_a.reverse to show stacks
        #target.push(source.pop)

        # Display our move
        print "#{source}->#{target} "

        # move the n - 1 disks that we left on auxiliary onto target
        move(n - 1, auxiliary, target, source)
    end
end
# initiate call from source A to target C with auxiliary B
puts move(5)
