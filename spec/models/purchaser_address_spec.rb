require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
    before do
      @purcahser_address = FactoryBot.build(:purcahser_address)
    end
  
    describe'商品購入機能' do
      context '出品登録がうまくいく時' do
       it "postal_code,area_id,municipality,number,phone_numberが存在する時に登録できる" do
        expect(@purcahser_address).to be_valid
       end
      end

      context '出品がうまくいかない時' do
        it "postal_codeが空のとき登録できない" do
          @purcahser_address.postal_code = nil
          @purcahser_address.valid?
          expect(@purcahser_address.errors.full_messages).to include{"Postal code can't be blank"}
        end
        it "postal_codeにハイフンが記載がないとき" do
          @purcahser_address.postal_code = "0000000"
          @purcahser_address.valid?
          expect(@purcahser_address.errors.full_messages).to include{"Postal code is invalid. Include hyphen(-)"}
        end
        it "area_idが空だと登録できない" do
          @purcahser_address.area_id = nil
          @purcahser_address.valid?
          expect(@purcahser_address.errors.full_messages).to include{"Area id code can't be blank"}
        end
        it "municipalityが空だと登録できない" do
          @purcahser_address.municipality = nil
          @purcahser_address.valid?
          expect(@purcahser_address.errors.full_messages).to include{"municipality code can't be blank"}
        end
        it "numberが空のとき登録できない" do
          @purcahser_address.number = nil
          @purcahser_address.valid?
          expect(@purcahser_address.errors.full_messages).to include{"number code can't be blank"}
        end
        it "phone_numberが空のとき登録できない" do
          @purcahser_address.phone_number = nil
          @purcahser_address.valid?
          expect(@purcahser_address.errors.full_messages).to include{"Phone number code can't be blank"}
        end
        it "phone_numberが11桁ではないとき" do
          @purcahser_address.phone_number = 00000000000
          @purcahser_address.valid?
          expect(@purcahser_address.errors.full_messages).to include{"Phone number Input only number"}
        end
      end
    end
  end
  
  
