AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Companies
3.times do
  company = Company.create(name: Faker::Company.name,
                          city: Faker::Address.city,
                          email: Faker::Internet.email,
                          phone: Faker::PhoneNumber.phone_number)
  # Addresses
  2.times do
    Address.create(street_address: Faker::Address.street_address,
                  street_address_line_2: Faker::Address.secondary_address,
                  city: company.city,
                  state: Faker::Address.state,
                  zip: Faker::Address.zip,
                  company_id: company.id)
  end
end

# Groups, DebitGroups, Credits
3.times do
  group = Group.create(street_address: Faker::Address.street_address,
                      payment_notes: Faker::Lorem.sentence,
                      memo: Faker::Lorem.sentence,
                      rent_amount: Faker::Number.number(4),
                      separate_checks: true,
                      first_payment_date: Time.now,
                      final_payment_date: Time.now,
                      company_id: Company.all.sample.id,
                      payment_address_id: 1,
                      city: Faker::Address.city,
                      invite_token: Faker::Number.number(8))

  debit_group = DebitGroup.create(group_id: group.id)

  Credit.create(debit_group_id: debit_group.id,
                status: Faker::Lorem.word,
                sent_date: Time.now,
                delivery_method: Faker::Hacker.noun)
end

# Users
5.times do
  u = User.create(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email)

  PaymentMethod.create(user_id: u.id,
                       balanced_bank_name: Faker::Company.name,
                       balanced_account_number: Faker::Number.number(10))
end

# Users groups, Recurring Payments, Debits
User.all.each do |user|
  g = Group.all.shuffle
  (0..3).to_a.sample.times do
    group = g.pop
    UsersGroup.create(user_id: user.id,
                      group_id: group.id)

    RecurringPayment.create(rent_amount: Faker::Number.number(3),
                            memo: Faker::Lorem.sentence,
                            user_id: user.id,
                            group_id: group.id,
                            payment_method_id: user.payment_methods.sample.id)

    Debit.create(rent_amount: Faker::Number.number(3),
                 status: 1,
                 debit_group_id: DebitGroup.find_by_group_id(group.id).id,
                 user_id: user.id,
                 payment_method_id: user.payment_methods.sample.id,
                 balanced_id: Faker::Number.number(8),
                 balanced_href: "http://balanced.net",
                 balanced_transaction_number: Faker::Number.number(4))
  end
end
