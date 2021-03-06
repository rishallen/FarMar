require_relative './spec_helper'


describe FarMar::Sale do
  it "exists" do
    FarMar::Sale.wont_be_nil
  end
end

describe FarMar::Sale do
  let(:sale) { FarMar::Sale.new(id: 5,  amount: 23, purchase_time: "t2013-11-13 01:49:37 -0800") } # you can also use "today at 5pm"

  it "it creates a new sale instance" do
  sale.must_be_instance_of(FarMar::Sale)
  end
end

describe "self#all" do
  before do
    @sales = FarMar::Sale.all # all is a self class
  end

  it "returns an array" do
    @sales.must_be_instance_of(Array)
  end

  it "returns a collection of instances from the CSV file" do
    @sales[0].must_be_instance_of(FarMar::Sale)
  end
end

describe "self#find" do
  before do
    # one instance of a sales class with an id value of one
    # this is an actual sales
    @one_sale = FarMar::Sale.find(1)
  end

  it "returns an instance of sales" do
    @one_sale.must_be_instance_of(FarMar::Sale)
  end
end

describe "FarMar::Sale#vendor" do
  let(:sale) { FarMar::Sale.find(14) }

  it "return an instance of FarMar::Vendor" do
    sale.vendor_id.must_equal(3)
  end
end

describe "FarMar::Sale#product" do
  let(:sale)  { FarMar::Sale.find(14) }

  it "should return an instance of FarMar::Sale#product_id" do
   sale.product_id.must_equal(4)
  end
end

describe "self#between(beginning_time, end_time)" do
  begins = Time.new(2013-11-10)
  ends = Time.new(2014-11-10)
  let(:sale) { FarMar::Sale  }

  it "a collection of FarMar::Sale objects between the 2 times given" do
    assert true, sale.between(begins, ends)
  end
end
