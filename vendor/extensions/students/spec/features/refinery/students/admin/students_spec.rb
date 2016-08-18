# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Students" do
    describe "Admin" do
      describe "students", type: :feature do
        refinery_login

        describe "students list" do
          before do
            FactoryGirl.create(:student, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:student, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.students_admin_students_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.students_admin_students_path

            click_link "Add New Student"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Students::Student, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Students::Student, :count)

              expect(page).to have_content("First Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:student, :first_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.students_admin_students_path

              click_link "Add New Student"

              fill_in "First Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Students::Student, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:student, :first_name => "A first_name") }

          it "should succeed" do
            visit refinery.students_admin_students_path

            within ".actions" do
              click_link "Edit this student"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            expect(page).to have_content("'A different first_name' was successfully updated.")
            expect(page).not_to have_content("A first_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:student, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.students_admin_students_path

            click_link "Remove this student forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Students::Student.count).to eq(0)
          end
        end

      end
    end
  end
end
