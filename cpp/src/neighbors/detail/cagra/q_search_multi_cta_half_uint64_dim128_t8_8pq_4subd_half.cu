
/*
 * Copyright (c) 2024, NVIDIA CORPORATION.
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

#include <raft/neighbors/detail/cagra/compute_distance_vpq.cuh>
#include <raft/neighbors/detail/cagra/search_multi_cta_kernel-inl.cuh>
#include <raft/neighbors/sample_filter_types.hpp>

namespace raft::neighbors::cagra::detail::multi_cta_search {

#define COMMA ,

#define instantiate_kernel_selection(TEAM_SIZE, MAX_DATASET_DIM, DATASET_DESC_T, SAMPLE_FILTER_T) \
  template void select_and_run<TEAM_SIZE, MAX_DATASET_DIM, DATASET_DESC_T, SAMPLE_FILTER_T>(      \
    DATASET_DESC_T dataset_desc,                                                                  \
    raft::device_matrix_view<const typename DATASET_DESC_T::INDEX_T, int64_t, row_major> graph,   \
    typename DATASET_DESC_T::INDEX_T* const topk_indices_ptr,                                     \
    typename DATASET_DESC_T::DISTANCE_T* const topk_distances_ptr,                                \
    const typename DATASET_DESC_T::DATA_T* const queries_ptr,                                     \
    const uint32_t num_queries,                                                                   \
    const typename DATASET_DESC_T::INDEX_T* dev_seed_ptr,                                         \
    uint32_t* const num_executed_iterations,                                                      \
    uint32_t topk,                                                                                \
    uint32_t block_size,                                                                          \
    uint32_t result_buffer_size,                                                                  \
    uint32_t smem_size,                                                                           \
    int64_t hash_bitlen,                                                                          \
    typename DATASET_DESC_T::INDEX_T* hashmap_ptr,                                                \
    uint32_t num_cta_per_query,                                                                   \
    uint32_t num_random_samplings,                                                                \
    uint64_t rand_xor_mask,                                                                       \
    uint32_t num_seeds,                                                                           \
    size_t itopk_size,                                                                            \
    size_t search_width,                                                                          \
    size_t min_iterations,                                                                        \
    size_t max_iterations,                                                                        \
    SAMPLE_FILTER_T sample_filter,                                                                \
    cudaStream_t stream);

instantiate_kernel_selection(
  8,
  128,
  raft::neighbors::cagra::detail::cagra_q_dataset_descriptor_t<
    half COMMA half COMMA 8 COMMA 4 COMMA 0 COMMA float COMMA uint64_t COMMA 0>,
  raft::neighbors::filtering::none_cagra_sample_filter);

#undef instantiate_kernel_selection

}  // namespace raft::neighbors::cagra::detail::multi_cta_search
