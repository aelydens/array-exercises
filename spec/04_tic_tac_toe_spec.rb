require 'spec_helper'

describe "Tic Tac Toe, in arrays" do
  let(:___) { nil }

  let(:data) {
    [
      ['X', 'O', 'O'],
      ['X', 'X', 'O'],
      ['O', 'X', 'O']
    ]
  }


  describe "counting usage per row" do
    it "returns how many times X was played in each row" do
      xs_per_row = []
      data.each_index do |row|
        xs_per_row << data[row].count("X")
      end
      xs_per_row

      expect(xs_per_row).to be == [1, 2, 1]
    end

    it "returns how many times O was played in each row" do
      os_per_row = data.map {|row| row.count("O")}
      expect(os_per_row).to be == [2, 1, 2]
    end
  end

  describe "getting coordinates of usage" do
    it "returns an array of [row, column] array coordinates for each usage of X" do
      x_coordinates = []
      data.each_index do |row|
        data[row].each_index do |column|
          if data[row][column] == "X"
            x_coordinates << [row, column]
          end
        end
        x_coordinates
      end

      expect(x_coordinates).to be == [[0, 0], [1, 0], [1, 1], [2, 1]]
    end

    it "returns an array of [row, column] array coordinates for each usage of O" do
      o_coordinates = []
      data.each_index do |row|
        data[row].each_index do |column|
          if data[row][column] == "O"
            o_coordinates << [row, column]
          end
        end
        o_coordinates
      end
      expect(o_coordinates).to be == [[0, 1], [0, 2], [1, 2], [2, 0], [2, 2]]
    end
  end

  describe "testing who won" do
    it "determines whether X or O won" do
      winner = ""
      score = ""
      column_score = ""
      data.each_index do |row|
        data[row].each_index do |column|
          score << data[row][column]
        end
      end
      column_score = score[0] + score[3] + score[6] + score[1] + score[4] + score[7] + score[2] + score[5] + score[8]
      if score.include?("XXX") || column_score.include?("XXX")
        winner = "X"
      elsif score.include?("OOO") || column_score.include?("OOO")
        winner = "O"
      end
      winner


      expect(winner).to be == 'O'
    end
  end
end
