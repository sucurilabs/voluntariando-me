#encoding: utf-8
class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name

      t.timestamps
    end
    professions = [
      "Agronomia",
      "Arquitetura",
      "Astronomia",
      "Artes Plásticas",
      "Biblioteconomia",
      "Biologia",
      "Biomedicina",
      "Biotecnologia",
      "Ciência da Computação",
      "Ciências Atuariais",
      "Ciências Contábeis",
      "Ciências Sociais",
      "Cinema",
      "Comério Exterior",
      "Comunicação Social",
      "Dança",
      "Desenho Indústrial",
      "Direito",
      "Design de Games",
      "Economia",
      "Educação Física",
      "Enfermagem",
      "Engenharia Ambiental",
      "Engenharia Aeronáutica",
      "Engenharia de Alimentos",
      "Engenharia Civil",
      "Engenharia Computação",
      "Engenharia Elétrica",
      "Engenharia Florestal",
      "Engenharia de Materiais",
      "Engenharia Mecânica",
      "Engenharia de Minas",
      "Engenharia Naval",
      "Engenharia Nuclear",
      "Engenharia de Petróleo",
      "Engenharia de Produção",
      "Engenharia Química",
      "Farmácia",
      "Física",
      "Filosofia",
      "Fisioterapia",
      "Fonoaudiologia",
      "Geografia",
      "Geologia",
      "Gerontologia",
      "Gestão Ambiental",
      "História",
      "Hotelaria e Turismo",
      "Jornalismo",
      "Letras",
      "Matemática",
      "Meteorologia",
      "Medicina",
      "Medicina Veterinária",
      "Moda",
      "Nutrição",
      "Oceanografia",
      "Odontologia",
      "Publicidade e Propaganda",
      "Pedagogia",
      "Psicologia",
      "Química",
      "Relações Internacionais",
      "Secretariado",
      "Sistemas de Informação",
      "Zootecnia"
    ]
    puts "\nCriando profissões...\n"
    professions.each do |profession|
      Profession.create(:name => profession)
    end
  end
end
