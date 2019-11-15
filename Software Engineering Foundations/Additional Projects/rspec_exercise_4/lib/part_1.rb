def my_reject(arr, &prc)
  res = []
  arr.each do |ele|
    res << ele unless prc.call(ele)
  end
  res
end

def my_one?(arr, &prc)
  count = 0
  arr.each do |ele|
    count += 1 if prc.call(ele)
    return false if count > 1
  end
  count == 1
end

def hash_select(hash, &prc)
  res = Hash.new
  hash.each do |k, v|
    res[k] = v if prc.call(k, v)
  end
  res
end

def xor_select(arr, prc_1, prc_2)
  res = []
  arr.each do |ele|
    res << ele if prc_1.call(ele) != prc_2.call(ele)
  end
  res
end

def proc_count(val, procs)
  count = 0
  procs.each do |prc|
    count += 1 if prc.call(val)
  end
  count
end