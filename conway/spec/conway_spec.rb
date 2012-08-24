require './conway'
describe Conway do
 describe "one neighbor" do
   it "should cause me to die" do
     grid = Conway::Grid.new [ [2,2,true], [2,1,true], [3,2,false], [2,3,false] ]
     grid.tick
     grid.cell_alive?(2,2).should be_false
   end
 end
 describe "two neighbors" do
  it "should cause me to live" do
    grid = Conway::Grid.new [ [2,2,true], [2,1,false], [3,2,true], [2,3,true] ]
    grid.tick
    grid.cell_alive?(2,2).should be_true
  end
 end
end
