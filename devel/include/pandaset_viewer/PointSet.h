// Generated by gencpp from file pandaset_viewer/PointSet.msg
// DO NOT EDIT!


#ifndef PANDASET_VIEWER_MESSAGE_POINTSET_H
#define PANDASET_VIEWER_MESSAGE_POINTSET_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <pandaset_viewer/LidarPoint.h>

namespace pandaset_viewer
{
template <class ContainerAllocator>
struct PointSet_
{
  typedef PointSet_<ContainerAllocator> Type;

  PointSet_()
    : header()
    , point()  {
    }
  PointSet_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , point(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::pandaset_viewer::LidarPoint_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::pandaset_viewer::LidarPoint_<ContainerAllocator> >::other >  _point_type;
  _point_type point;





  typedef boost::shared_ptr< ::pandaset_viewer::PointSet_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pandaset_viewer::PointSet_<ContainerAllocator> const> ConstPtr;

}; // struct PointSet_

typedef ::pandaset_viewer::PointSet_<std::allocator<void> > PointSet;

typedef boost::shared_ptr< ::pandaset_viewer::PointSet > PointSetPtr;
typedef boost::shared_ptr< ::pandaset_viewer::PointSet const> PointSetConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pandaset_viewer::PointSet_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pandaset_viewer::PointSet_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pandaset_viewer::PointSet_<ContainerAllocator1> & lhs, const ::pandaset_viewer::PointSet_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.point == rhs.point;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pandaset_viewer::PointSet_<ContainerAllocator1> & lhs, const ::pandaset_viewer::PointSet_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pandaset_viewer

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::pandaset_viewer::PointSet_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pandaset_viewer::PointSet_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pandaset_viewer::PointSet_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pandaset_viewer::PointSet_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pandaset_viewer::PointSet_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pandaset_viewer::PointSet_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pandaset_viewer::PointSet_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1679945ed2af83f1230099c1fce22a9c";
  }

  static const char* value(const ::pandaset_viewer::PointSet_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1679945ed2af83f1ULL;
  static const uint64_t static_value2 = 0x230099c1fce22a9cULL;
};

template<class ContainerAllocator>
struct DataType< ::pandaset_viewer::PointSet_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pandaset_viewer/PointSet";
  }

  static const char* value(const ::pandaset_viewer::PointSet_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pandaset_viewer::PointSet_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"LidarPoint[] point\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: pandaset_viewer/LidarPoint\n"
"float32 x\n"
"float32 y\n"
"float32 z\n"
"float32 i\n"
"int64 semseg\n"
;
  }

  static const char* value(const ::pandaset_viewer::PointSet_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pandaset_viewer::PointSet_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.point);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PointSet_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pandaset_viewer::PointSet_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pandaset_viewer::PointSet_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "point[]" << std::endl;
    for (size_t i = 0; i < v.point.size(); ++i)
    {
      s << indent << "  point[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::pandaset_viewer::LidarPoint_<ContainerAllocator> >::stream(s, indent + "    ", v.point[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PANDASET_VIEWER_MESSAGE_POINTSET_H
