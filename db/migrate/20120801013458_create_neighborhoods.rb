#encoding: utf-8
class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :localization_id

      t.timestamps
    end
    neighborhood_localizations = [
      ["Caju", "Castelo", "Catumbi", "Centro", "Cidade Nova", "Estácio", "Gamboa", "Lapa", "Paquetá", "Santa Teresa", "Santo Cristo", "Saúde"],
      ["Botafogo", "Catete", "Copacabana", "Cosme Velho", "Flamengo", "Gávea", "Glória", "Humaitá", "Ipanema", "Jardim Botânico", "Lagoa", "Laranjeiras", "Leblon", "Leme", "Rocinha", "São Conrado", "Urca", "Vidigal"],
      ["Abolição", "Acari", "Água Santa", "Aldeia Campista", "Alto da Boa Vista", "Anchieta", "Andaraí", "Bancários", "Barros Filho", "Benfica", "Bento Ribeiro", "Bonsucesso", "Brás de Pina", "Cachambi", "Cacuia", "Cascadura", "Cavalcante", "Cidade Universitária", "Cocotá", "Coelho Neto", "Colégio", "Complexo da Maré", "Complexo do Alemão", "Cordovil", "Costa Barros", "Del Castilho", "Encantado", "Engenheiro Leal", "Engenho da Rainha", "Engenho de Dentro", "Engenho Novo", "Freguesia da Ilha", "Galeão", "Grajaú", "Guadalupe", "Higienópolis", "Honório Gurgel", "Inhaúma", "Irajá", "Jacaré", "Jacarezinho", "Jardim América", "Jardim Carioca", "Jardim Guanabara", "Lins de Vasconcelos", "Madureira", "Manguinhos", "Maracanã", "Marechal Hermes", "Maria da Graça", "Méier", "Moneró", "Olaria", "Oswaldo Cruz", "Parada de Lucas", "Parque Anchieta", "Parque Colúmbia", "Pavuna", "Penha", "Penha Circular", "Piedade", "Pilares", "Pitangueiras", "Portuguesa", "Praça da Bandeira", "Praia da Bandeira", "Quintino Bocaiúva", "Ramos", "Riachuelo", "Ribeira", "Ricardo de Albuquerque", "Rio Comprido", "Rocha", "Rocha Miranda", "Sampaio", "São Cristóvão", "São Franscisco Xavier", "Tauá", "Tijuca", "Todos os Santos", "Tomás Coelho", "Triagem", "Turiaçu", "Vasco da Gama", "Vaz Lobo", "Vicente de Carvalho", "Vila da Penha", "Vila Isabel", "Vila Kosmos", "Vista Alegre", "Zumbi"],
      ["Anil", "Bangu", "Barra da Tijuca", "Barra de Guaratiba", "Camorim", "Campinho", "Campo dos Afonsos", "Campo Grande", "Cidade de Deus", "Colônia", "Cosmos", "Curicica", "Deodoro", "Freguesia de Jacarepaguá", "Gardênia Azul", "Gericinó", "Grumari", "Guaratiba", "Inhoaíba", "Itanhangá", "Jacarepaguá", "Jardim Sulacap", "Joá", "Magalhães Bastos", "Paciência", "Padre Miguel", "Pechincha", "Pedra de Guaratiba", "Praça Seca", "Realengo", "Recreio dos Bandeirantes", "Santa Cruz", "Santíssimo", "Senador Camará", "Senador Vasconcelos", "Sepetiba", "Tanque", "Taquara", "Vargem Grande", "Vargem Pequena", "Vila Aliança", "Vila Militar", "Vila Valqueire"]
    ]
    neighborhood_localizations.each_with_index do |neighborhood_localization, index|
      puts "\n Cadastrando #{neighborhood_localization.size} bairros do(a) #{Neighborhood::LOCALIZATIONS[index]}...\n"
      neighborhood_localization.each do |neighborhood|
        Neighborhood.create(:name => neighborhood, :localization_id => index)
      end
    end 
  end
end
