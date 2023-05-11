//
//  EntryFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

enum EntryFactory {
    static func getViewControlller (entryChoosen: EntryChoosen, output: EntryOutput) -> UIViewController {
        let mainView = EntryView()
        let vc = EntryViewController(mainView: mainView)
        let viewModel = EntryViewModel(entryChoosen: entryChoosen)
        viewModel.output = output
        vc.setViewModel(viewModel: viewModel)
        return vc
    }
}
