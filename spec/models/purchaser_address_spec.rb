require 'rails_helper'
describe PurchaserAddress do
  before do
    @purchaser_address = FactoryBot.build(:purchaser_address)
  end
  
    describe'商品購入機能' do
      context '出品登録がうまくいく時' do
       it "postal_code,area_id,municipality,number,phone_number,token,building_nameが存在する時に登録できる" do
        expect(@purchaser_address).to be_valid
       end

       it "building_nameに空でも登録できる" do
         @purchaser_address.building_name = ""
         expect(@purchaser_address).to be_valid
        end
      end

      context '出品がうまくいかない時' do
        it "tokenが空のとき登録できない" do
          @purchaser_address.token = nil
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include("Token can't be blank")
         end

        it "postal_codeが空のとき登録できない" do
          @purchaser_address.postal_code = nil
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"Postal code can't be blank"}
        end

        it "postal_codeにハイフンが記載がないとき登録できない" do
          @purchaser_address.postal_code = "0000000"
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"Postal code is invalid. Include hyphen(-)"}
        end

        it "area_idが空だと登録できない" do
          @purchaser_address.area_id = nil
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"Area id code can't be blank"}
        end

        it "area_idが1だと登録できない" do
        @purchaser_address.area_id = 1
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"Area id code can't be blank"}
        end

        it "municipalityが空だと登録できない" do
          @purchaser_address.municipality = nil
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"municipality code can't be blank"}
        end

        it "numberが空のとき登録できない" do
          @purchaser_address.number = nil
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"number code can't be blank"}
        end

        it "phone_numberが空のとき登録できない" do
          @purchaser_address.phone_number = nil
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"Phone number code can't be blank"}
        end

        it "phone_numberが11桁ではないとき" do
          @purchaser_address.phone_number = "000000000000"
          @purchaser_address.valid?
          expect(@purchaser_address.errors.full_messages).to include{"Phone number Input only number"}
        end
    end
  end
end


  
