//
//  StudentListViewModel.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

final class StudentListViewModel {
    
    public var onSectionSequenceChange: ((SectionSequence) -> ())?
    public var onError: ((Error) -> ())?
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
}
