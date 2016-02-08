FactoryGirl.define do
  factory :recipe do
    name "Almôndegas de carne com pimenta"
    servings 4
    preparation_time 90
    difficulty "Médio"
    ingredients "400g de carne moída, 1 colher de chpa de garam masala,
                 azeite de oliva, 3 pimentôes vermelhos"
    steps "Coloque 1 cancea de trigo bulgur,
           2 canecas de água fervente, o limão em conversa, tampe e mexa"
  end
end
