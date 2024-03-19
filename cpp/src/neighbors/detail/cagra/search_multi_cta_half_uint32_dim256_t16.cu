/*
 * Copyright (c) 2023-2024, NVIDIA CORPORATION.
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

/*
 * NOTE: this file is generated by search_multi_cta_00_generate.py
 *
 * Make changes there and run in this directory:
 *
 * > python search_multi_cta_00_generate.py
 *
 */

#include "search_multi_cta.cuh"

#include <raft/neighbors/detail/cagra/compute_distance.hpp>

namespace raft::neighbors::cagra::detail::multi_cta_search {
instantiate_kernel_selection(16,
                             256,
                             raft::neighbors::cagra::detail::standard_dataset_descriptor_t<
                               half COMMA uint32_t COMMA 0 COMMA 0 COMMA float>,
                             raft::neighbors::filtering::none_cagra_sample_filter);

}  // namespace raft::neighbors::cagra::detail::multi_cta_search
