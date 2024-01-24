//
//  TempCapsuleView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/23/24.
//

import UIKit
import SnapKit

class TempCapsuleView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    init(text: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        // UILabel의 텍스트 설정
        label.text = text
        
        // 뷰에 UILabel 추가
        addSubview(label)
        
        // Auto Layout 설정
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 7, left: 12, bottom: 7, right: 12))
        }
        
        // 배경색 설정
        self.backgroundColor = backgroundColor
        
        // cornerRadius 설정
        layer.cornerRadius = 12
        
        // 캡슐 형태의 UIView 다시 그리기
        setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 배경을 캡슐 모양으로 그림
    override func draw(_ rect: CGRect) {
        let capsulePath = UIBezierPath(roundedRect: bounds, cornerRadius: 12)
        backgroundColor?.setFill()
        capsulePath.fill()
    }
    
    // 외부에서 텍스트 업데이트 메서드를 호출하여 동적으로 내용을 변경할 수 있도록 함
    func updateText(_ newText: String) {
        label.text = newText
    }
}
