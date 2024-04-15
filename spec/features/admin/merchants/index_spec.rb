require "rails_helper"

RSpec.describe "Admin Merchants Index" do
  before(:each) do
    @merchant1 = Merchant.create(name: "Amazon")
    @merchant2 = Merchant.create(name: "Walmart")
    @merchant3 = Merchant.create(name: "Target")
   
  end

  describe '#us 24' do
    it 'see each merchant on the page ' do
      # When I visit the admin merchants index (/admin/merchants)
      visit admin_merchants_path
      # Then I see the name of each merchant in the system
      expect(page).to have_content(@merchant1.name)
      expect(page).to have_content(@merchant2.name)
      expect(page).to have_content(@merchant3.name)
     
    end
  end

  describe '#us 25' do
    it 'see a specific merchants show page ' do
      visit admin_merchants_path
      # When I click on the name of a merchant from the admin merchants index page (/admin/merchants),
      expect(page).to have_link("#{@merchant1.name}")
      # require 'pry'; binding.pry
      click_on("#{@merchant1.name}")
      # Then I am taken to that merchant's admin show page (/admin/merchants/:merchant_id)
      expect(current_path).to eq(admin_merchant_path(@merchant1.id))
      # And I see the name of that merchant
      expect(page).to have_content("#{@merchant1.name}")
    end
  end

  describe '#us 27' do
    it 'has a button of enable or disable' do
      # When I visit the admin merchants index (/admin/merchants)
      visit admin_merchants_path
      # Then next to each merchant name I see a button to disable or enable that merchant.
      within "#merchant-#{@merchant1.id}" do
        expect(page).to have_button("Enable")
        # When I click this button
        click_on("Enable")
      end
      # Then I am redirected back to the admin merchants index
      expect(current_path).to eq(admin_merchants_path)
      # And I see that the merchant's status has changed
      within "#merchant-#{@merchant1.id}" do
        expect(page).to have_button("Disable")
        expect(page).to have_content("Enabled")
      end
    end

    describe '#us29' do
      it 'creates a new merchant' do

        # When I visit the admin merchants index (/admin/merchants)
        visit admin_merchants_path
        # I see a link to create a new merchant.
        expect(page).to have_link("Create Merchant")
        # When I click on the link,
        click_on("Create Merchant")
        # I am taken to a form that allows me to add merchant information.
         # expect(current_path).to eq()
        fill_in :name, with: "Nike"
        # When I fill out the form I click ‘Submit’

        # Then I am taken back to the admin merchants index page
        # And I see the merchant I just created displayed
        # And I see my merchant was created with a default status of disabled.
        expect().to eq()
      end
    end
  end
end

