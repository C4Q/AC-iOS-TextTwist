import Foundation

class ViewModel {
    private let wordModel: WordDataModeling?
    private var textData: TextTwistInfo?
    var letters: String?
    
    init(wordModel: WordDataModeling = WordData()) {
        self.wordModel = wordModel
        self.textData = wordModel.randomInfoGenerator()
        self.letters = textData?.letters
    }
    
    func getNewData() {
            textData = wordModel?.randomInfoGenerator()
    }
    
    
}
