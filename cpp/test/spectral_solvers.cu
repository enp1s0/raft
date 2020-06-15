/*
 * Copyright (c) 2020, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <gtest/gtest.h>
#include <iostream>
#include <memory>
#include <raft/handle.hpp>

#include <raft/spectral/kmeans.hpp>

namespace raft {

TEST(Raft, ClusterSolvers) {
  using namespace matrix;
  using index_type = int;
  using value_type = double;

  handle_t h;
  ASSERT_EQ(0, h.get_num_internal_streams());
  ASSERT_EQ(0, h.get_device());

  index_type maxiter{100};
  value_type tol{1.0e-10};
  index_type iter;
  value_type* eigvecs{nullptr};
  unsigned long long seed{100110021003};

  auto stream = h.get_stream();
  //thrust::cuda::par.on(stream);

  index_type n{100};
  index_type d{10};
  index_type k{5};
  index_type* codes{nullptr};
  value_type residual;

  kmeans(h, thrust::cuda::par.on(stream), n, d, k, tol, maxiter, eigvecs, codes,
         residual, iter, seed);
}

}  // namespace raft
