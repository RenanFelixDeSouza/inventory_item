class Inventory

  def initialize
    @item = []
  end

  def add_item

    
    puts "\ndigite o nome"
    nome = gets.chomp
  
    puts "\ndigite a quantidade"
    quantidade = gets.chomp.to_i
  
    puts "\ndigite o valor"
    preco = gets.chomp.to_f

    item = @item.find { |item| item[:nome] == nome }
    if item
      puts "\n Já existe um produto com o nome #{nome}, digite 1 para adicionar as quantidades ao produto ja cadastrado\n"
      prod = gets.chomp.to_i

      case prod
    when 1
      item[:quantidade] += quantidade
      puts "\n quantidade somada ao produto #{nome}"
    when 2
      puts "\nação cancelada"
      end
    else
    @item << { nome: nome, quantidade: quantidade, preco: preco}
    end
  puts "\nresumo do catálogo#{@item}\n"
  end

  def remove_item
    puts "\nDigite o nome do produto que deseja remover"
    nome = gets.chomp

    item = @item.find { |item| item[:nome] == nome }

    if item
    puts "\nTem certeza que deseja apagar o produto #{nome}?\n Digite 1 para sim, 2 para não."
    confirm = gets.chomp.to_i
      case confirm

      when 1
      @item.delete_if { |item| item[:nome] == nome }
      puts "\n #{nome} removido com sucesso!\n"
      when 2
      puts "\nAção cancelada\n"
    end
    
    else 
      puts "\nNome do produto não encontrado\n"
  end
end

  def list_item
    puts "\nLista de itens:"
    @item.each do |item|
      puts "\nNome do produto: #{item[:nome]} | Quantidade: #{item[:quantidade]} | Preço: R$#{item[:preco]} | total: #{item[:preco] * item[:quantidade]}"
    end
    puts "\n-------------------------"
  end

  def value_item
    total = 0
      @item.each do |item|
      total += item[:preco] * item[:quantidade]
      end
      puts "\no valor total dos produtos somados é: #{total}"
  end
end

inventario = Inventory.new 

loop do 

  
puts "\nO que deseja fazer?\n 1. Adicionar items\n 2. Remover items\n 3. Listar items\n 4. Valor total\n 5. sair"

item = gets.chomp.to_i
case item 

when 1

 inventario.add_item
when 2
  inventario.remove_item
when 3
  inventario.list_item
when 4
  inventario.value_item
when 5
  break
end
end
