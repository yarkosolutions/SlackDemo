
//
//  SlackInputBar.swift
//  SlackDemo
//
//  Created by Yarok on 3/19/25.
//

import UIKit
import InputBarAccessoryView

final class SlackInputBar: InputBarAccessoryView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(){
        let items = [
            makeButton(named: "plus.circle")
                .onSelected {
                    $0.tintColor = .systemBlue
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .photoLibrary
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController?.present(imagePicker, animated: true, completion: nil)
                },
            makeButton(named: "textformat")
                .onSelected {
                    $0.tintColor = .systemBlue
                },
            makeButton(named: "face.smiling")
                .onSelected {
                    $0.tintColor = .systemBlue
                },
            makeButton(named: "at").onSelected {
                self.inputPlugins.forEach { _ = $0.handleInput(of: "@" as AnyObject) }
                $0.tintColor = .systemBlue
            },
            makeButton(named: "line.diagonal").onSelected {
                $0.tintColor = .systemBlue
            },
            .flexibleSpace,
            sendButton
                .configure {
                    $0.setTitle(nil, for: .normal)
                    $0.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
                    $0.setSize(CGSize(width: 32, height: 32), animated: false)
                }.onDisabled {
                    $0.setImage(UIImage(systemName: "paperplane.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), for: .normal)
                }.onEnabled {
                    $0.setImage(UIImage(systemName: "paperplane.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), for: .normal)
                }.onSelected {
                    // We use a transform becuase changing the size would cause the other views to relayout
                    $0.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }.onDeselected {
                    $0.transform = CGAffineTransform.identity
                }
        ]
        items.forEach { $0.tintColor = .lightGray }
        // We can change the container insets if we want
        inputTextView.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
        let maxSizeItem = InputBarButtonItem()
            .configure {
                $0.image = UIImage(systemName: "arrow.down.left.and.arrow.up.right.rectangle")?.withRenderingMode(.alwaysTemplate)
                $0.tintColor = .darkGray
                $0.setSize(CGSize(width: 20, height: 20), animated: false)
            }.onSelected {
                let oldValue = $0.inputBarAccessoryView?.shouldForceTextViewMaxHeight ?? false
                $0.image = oldValue ? UIImage(systemName: "arrow.down.left.and.arrow.up.right.rectangle")?.withRenderingMode(.alwaysTemplate) : UIImage(systemName: "arrow.up.right.and.arrow.down.left.rectangle")?.withRenderingMode(.alwaysTemplate)
                self.setShouldForceMaxTextViewHeight(to: !oldValue, animated: true)
            }
        rightStackView.alignment = .top
        setStackViewItems([maxSizeItem], forStack: .right, animated: false)
        setRightStackViewWidthConstant(to: 20, animated: false)
        // Finally set the items
        setStackViewItems(items, forStack: .bottom, animated: false)
        shouldAnimateTextDidChangeLayout = true
    }

    private func makeButton(named: String) -> InputBarButtonItem {
        return InputBarButtonItem()
            .configure {
                $0.spacing = .fixed(4)
                $0.image = UIImage(systemName: named)?.withRenderingMode(.alwaysTemplate)
                $0.setSize(CGSize(width: 24, height: 24), animated: false)
            }.onSelected {
                $0.tintColor = .systemBlue
            }.onDeselected {
                $0.tintColor = UIColor.lightGray
            }.onTouchUpInside { _ in
                print("Item Tapped")
            }
    }
}

extension SlackInputBar: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        
        picker.dismiss(animated: true, completion: {
            if let pickedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
                self.inputPlugins.forEach { _ = $0.handleInput(of: pickedImage) }
            }
        })
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

