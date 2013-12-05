describe "Factories" do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    describe ":#{factory_name}" do
      it 'is valid' do
        factory = FactoryGirl.create(factory_name)
        another_factory = FactoryGirl.create(factory_name)

        if factory.respond_to?(:valid?)
          expect(factory).to be_valid, lambda { factory.errors.full_messages.join(',') } # the lamba syntax only works with rspec 2.14 or newer;  for earlier versions, you have to call #valid? before calling the matcher, otherwise the errors will be empty
        end
      end
    end
  end
end
