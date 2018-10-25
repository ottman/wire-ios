//
// Wire
// Copyright (C) 2018 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import Foundation

class ConversationTextMessageCell: UIView, ConversationMessageCell {

    struct Configuration {
        let attributedText: NSAttributedString
    }

    let messageTextView = LinkInteractionTextView()
    var isSelected: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
        configureConstraints()
    }

    private func configureSubviews() {
        messageTextView.isEditable = false
        messageTextView.isSelectable = false
        messageTextView.backgroundColor = UIColor(scheme: .contentBackground)
        messageTextView.isScrollEnabled = false
        messageTextView.textContainerInset = .zero
        messageTextView.textContainer.lineFragmentPadding = 0
        messageTextView.isUserInteractionEnabled = true
        messageTextView.accessibilityIdentifier = "Message"
        messageTextView.accessibilityElementsHidden = false
        messageTextView.dataDetectorTypes = [.link, .address, .phoneNumber, .flightNumber, .calendarEvent, .shipmentTrackingNumber]

        addSubview(messageTextView)
    }

    private func configureConstraints() {
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.fitInSuperview()
    }

    func configure(with object: Configuration) {
        messageTextView.attributedText = object.attributedText
    }

}

class ConversationTextMessageCellDescription: ConversationMessageCellDescription {
    typealias View = ConversationTextMessageCell
    let configuration: View.Configuration

    var isFullWidth: Bool {
        return false
    }

    init(attributedString: NSAttributedString) {
        self.configuration = View.Configuration(attributedText: attributedString)
    }

}