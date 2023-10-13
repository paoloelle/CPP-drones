// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for simulator/position3D
#include "boost/date_time.hpp"
#include "boost/shared_array.hpp"
#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable : 4244)
#pragma warning(disable : 4265)
#pragma warning(disable : 4458)
#pragma warning(disable : 4100)
#pragma warning(disable : 4127)
#pragma warning(disable : 4267)
#pragma warning(disable : 4068)
#pragma warning(disable : 4245)
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wredundant-decls"
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Wdelete-non-virtual-dtor"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wshadow"
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#endif //_MSC_VER
#include "ros/ros.h"
#include "simulator/position3D.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class SIMULATOR_EXPORT simulator_msg_position3D_common : public MATLABROSMsgInterface<simulator::position3D> {
  public:
    virtual ~simulator_msg_position3D_common(){}
    virtual void copy_from_struct(simulator::position3D* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const simulator::position3D* msg, MultiLibLoader loader, size_t size = 1);
};
  void simulator_msg_position3D_common::copy_from_struct(simulator::position3D* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //x
        const matlab::data::TypedArray<double> x_arr = arr["X"];
        size_t nelem = x_arr.getNumberOfElements();
        	msg->x.resize(nelem);
        	std::copy(x_arr.begin(), x_arr.begin()+nelem, msg->x.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'X' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'X' is wrong type; expected a double.");
    }
    try {
        //y
        const matlab::data::TypedArray<double> y_arr = arr["Y"];
        size_t nelem = y_arr.getNumberOfElements();
        	msg->y.resize(nelem);
        	std::copy(y_arr.begin(), y_arr.begin()+nelem, msg->y.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Y' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Y' is wrong type; expected a double.");
    }
    try {
        //z
        const matlab::data::TypedArray<double> z_arr = arr["Z"];
        size_t nelem = z_arr.getNumberOfElements();
        	msg->z.resize(nelem);
        	std::copy(z_arr.begin(), z_arr.begin()+nelem, msg->z.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Z' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Z' is wrong type; expected a double.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T simulator_msg_position3D_common::get_arr(MDFactory_T& factory, const simulator::position3D* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","X","Y","Z"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("simulator/position3D");
    // x
    auto currentElement_x = (msg + ctr)->x;
    outArray[ctr]["X"] = factory.createArray<simulator::position3D::_x_type::const_iterator, double>({currentElement_x.size(),1}, currentElement_x.begin(), currentElement_x.end());
    // y
    auto currentElement_y = (msg + ctr)->y;
    outArray[ctr]["Y"] = factory.createArray<simulator::position3D::_y_type::const_iterator, double>({currentElement_y.size(),1}, currentElement_y.begin(), currentElement_y.end());
    // z
    auto currentElement_z = (msg + ctr)->z;
    outArray[ctr]["Z"] = factory.createArray<simulator::position3D::_z_type::const_iterator, double>({currentElement_z.size(),1}, currentElement_z.begin(), currentElement_z.end());
    }
    return std::move(outArray);
  } 
class SIMULATOR_EXPORT simulator_position3D_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~simulator_position3D_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          simulator_position3D_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<simulator::position3D,simulator_msg_position3D_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         simulator_position3D_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<simulator::position3D,simulator::position3D::ConstPtr,simulator_msg_position3D_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         simulator_position3D_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<simulator::position3D,simulator_msg_position3D_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(simulator_msg_position3D_common, MATLABROSMsgInterface<simulator::position3D>)
CLASS_LOADER_REGISTER_CLASS(simulator_position3D_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1