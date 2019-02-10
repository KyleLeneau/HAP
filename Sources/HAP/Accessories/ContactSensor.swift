extension Accessory {
    open class ContactSensor: Accessory {
        public let contactSensor = Service.ContactSensor()

        public init(info: Service.Info, additionalServices: [Service] = []) {
            super.init(info: info, type: .sensor, services: [contactSensor] + additionalServices)
        }
    }
}

public enum ContactSensorState: Int, CharacteristicValueType {
    case detected = 0
    case notDetected = 1
}

extension Service {
    open class ContactSensor: ContactSensorBase {
    }
}
