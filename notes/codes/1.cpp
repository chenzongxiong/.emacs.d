// #include <boost/graph/adjacency_list.hpp>
// #include <tuple>
// #include <algorithm>
// #include <iterator>
// #include <iostream>

// int main()
// {
//   typedef boost::adjacency_list<boost::setS, boost::vecS,
//     boost::undirectedS> graph;
//   graph g;

//   enum { topLeft, topRight, bottomRight, bottomLeft };

//   boost::add_edge(topLeft, topRight, g);
//   boost::add_edge(topRight, bottomRight, g);
//   boost::add_edge(bottomRight, bottomLeft, g);
//   boost::add_edge(bottomLeft, topLeft, g);

//   graph::edge_iterator it, end;
//   std::tie(it, end) = boost::edges(g);
//   std::copy(it, end,
//     std::ostream_iterator<graph::edge_descriptor>{std::cout, "\n"});
// }

// #include <boost/graph/adjacency_list.hpp>
// #include <utility>
// #include <algorithm>
// #include <iterator>
// #include <iostream>

// using namespace boost;
// using namespace std;

// int main()
// {
//   boost::adjacency_list<> g;

//   boost::add_vertex(g);
//   boost::add_vertex(g);
//   boost::add_vertex(g);
//   boost::add_vertex(g);

//   std::pair<boost::adjacency_list<>::vertex_iterator,
//     boost::adjacency_list<>::vertex_iterator> vs = boost::vertices(g);

//   std::copy(vs.first, vs.second,
//     std::ostream_iterator<boost::adjacency_list<>::vertex_descriptor>{
//       std::cout, "\n"});
// }

#include <boost/graph/adjacency_list.hpp>
#include <iostream>

struct myVertex {
  size_t id;
  size_t data;
};
struct myEdge {
  size_t id;
  size_t data;
};

using myGraph_t = boost::adjacency_list<boost::listS, boost::vecS, boost::undirectedS, myVertex, myEdge>;

using vertex_it = boost::adjacency_list<>::vertex_iterator;

int main()
{
  // boost::adjacency_list<> g;
  myGraph_t g;

  myGraph_t::vertex_descriptor v1 = boost::add_vertex(g);
  myGraph_t::vertex_descriptor v2 = boost::add_vertex(g);
  myGraph_t::vertex_descriptor v3 = boost::add_vertex(g);
  myGraph_t::vertex_descriptor v4 = boost::add_vertex(g);

//   std::pair<boost::adjacency_list<>::vertex_iterator,
//     boost::adjacency_list<>::vertex_iterator> vs = boost::vertices(g);
  vertex_it vertex, vertex_next, vertex_end;
  boost::tie(vertex, vertex_end) = boost::vertices(g);
  for(vertex_next = vertex; vertex != vertex_end; vertex = vertex_next) {
    ++ vertex_next;
    // std::cout << g[*vertex] << std::endl;;
    // std::cout << *vertex << std::endl;

    std::cout << *vertex << std::endl;
  }

  std::cout << v1 << ", " << v2 << ", " << v3 << ", " << v4 << '\n';
  return 0;
}
