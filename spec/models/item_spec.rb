require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe'商品出品機能'do
    context '出品登録がうまくいくとき' do
      it "nameとinfo、categoryとcondition、areaとestimated,sellerとimageとpriceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end 
      it "name--だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "info--だと登録できない" do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "categoryが--だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it "conditionが--だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it "areaが--だと登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it "estimatedが--だと登録できない" do
        @item.estimated_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it "sellerが--だと登録できない" do
        @item.seller_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it "priceが--だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it "priceは半角数字でなければ登録できない" do
        @item.price = "２２２２２"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが、¥300以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが、¥9,999,999以上では登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end



