# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Sections" do
    describe "Admin" do
      describe "sections", type: :feature do
        refinery_login

        describe "sections list" do
          before do
            FactoryGirl.create(:section, :title => "UniqueTitleOne")
            FactoryGirl.create(:section, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.sections_admin_sections_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.sections_admin_sections_path

            click_link "Add New Section"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Sections::Section, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Sections::Section, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:section, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.sections_admin_sections_path

              click_link "Add New Section"

              fill_in "Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Sections::Section, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:section, :title => "A title") }

          it "should succeed" do
            visit refinery.sections_admin_sections_path

            within ".actions" do
              click_link "Edit this section"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:section, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.sections_admin_sections_path

            click_link "Remove this section forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Sections::Section.count).to eq(0)
          end
        end

      end
    end
  end
end
